"""
train.py
Train CNN model and save it as "model.pkl"
"""
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
from torch.utils.data import Dataset, random_split
from PIL import Image
from torch.autograd import Variable
from Preprocess import transform,SplitDataFromTrainAndTest
from model import LeNet,test_network
torch.manual_seed(11)

'''
Hypermeters
'''
device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
learning_rate = 0.001
dataset = "./Character_36_Data"
train_val_split = 0.8 # we split data into 80% train data and 20% test data
batch_size = 64 # 128 or 256
epochs = 200
model = LeNet().to(device)
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=learning_rate)
'''
Data_Loader
'''
data = torchvision.datasets.ImageFolder(root=dataset)
train_len = int((train_val_split)*len(data))
valid_len = len(data) - train_len
train_subset, valid_subset = random_split(data, [train_len, valid_len])
trainset = SplitDataFromTrainAndTest(train_subset, transform=transform())
validset = SplitDataFromTrainAndTest(valid_subset, transform=transform())

trainloader = torch.utils.data.DataLoader(trainset,  batch_size=batch_size, shuffle=True)
validloader = torch.utils.data.DataLoader(validset, batch_size=batch_size, shuffle=True)

'''
Train
'''
for epoch in range(1, epochs + 1):
    total_loss = 0
    total_images = 0
    total_correct = 0
    for batch in trainloader:  # Load batch
        images, labels = batch
        images = images.to(device)
        labels = labels.to(device)
        outputs = model(images)
        loss = criterion(outputs, labels)
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
        output = outputs.argmax(dim=1)
        total_images += labels.size(0)
        total_correct += output.eq(labels).sum().item()
        model_accuracy = total_correct / total_images * 100

    print('Epoch {0} correct Sample: {1} loss Computing: {2:.2f} accuracy for Training: {3:.2f}'.format(
        epoch, total_correct, total_loss, model_accuracy))
    test_network(model, validloader,device)

torch.save(model, 'model.pkl')