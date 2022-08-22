"""
model.py
Defibe LeNet and Test_work
"""
import torch
import torch.nn as nn
channel_in = 1
channel_out = 6
kernel_size = 5
stride = 2
out_class = 36  # 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ
kernel_size_pooling = 2
class LeNet(nn.Module): # LeNet
    def __init__(self):
        super(LeNet, self).__init__()
        '''
        Define the first Convolutional Layer
        '''
        self.conv1 = nn.Sequential(
            nn.Conv2d(channel_in, channel_out, kernel_size), # in_channels, out_channels, kernel_size
            nn.ReLU(),
            nn.MaxPool2d(kernel_size_pooling, stride), # kernel_size, stride
        )
        '''
           Define the second Convolutional Layer
        '''
        self.conv2 = nn.Sequential(
            nn.Conv2d(channel_out, 16, kernel_size),
            nn.ReLU(),
            nn.MaxPool2d(stride, stride)
        )
        '''
        Define Fully Connect Layer 1
        '''
        self.fc1 = nn.Sequential(
            nn.Linear(16*4*4, 120),
            nn.ReLU()
        )
        '''
        Define Fully Connect Layer 2
        '''
        self.fc2 = nn.Sequential(
            nn.Linear(120, 84),
            nn.ReLU()
        )
        '''
        Define Output Layer
        '''
        self.out = nn.Linear(84, out_class)

    def forward(self, img):
        feature1 = self.conv1(img)
        feature2 = self.conv2(feature1)
        fc1 = self.fc1(feature2.view(img.shape[0], -1))
        fc2 = self.fc2(fc1)
        output = self.out(fc2)
        return output

def test_network(net,testloader,device):      ############Test Data For Once##########
    net.eval()
    total_images = 0
    total_correct = 0
    with torch.no_grad():
        for data in testloader:
            images, labels = data
            images = images.to(device)
            labels = labels.to(device)
            outputs = net(images)
            _, predicted = torch.max(outputs.data, 1)
            total_images += labels.size(0)
            total_correct += (predicted == labels).sum().item()

    model_accuracy = total_correct / total_images * 100
    print('Accuracy on {0} testing Dataset: {1:.2f}%'.format(total_images, model_accuracy))
    net.train()
