"""
Detect_Plate.py
Using open_CV and CNN model "LeNet" to detect Car License number
"""
import torch.nn as nn
from torchvision import torch,datasets,transforms,models
import matplotlib.pyplot as plt
import numpy as np
import imutils
from PIL import Image as Image_PIL
import cv2
from Preprocess import segment_characters,Find_Edge_Plate
from model import LeNet
characters = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
output = []


"""
Select the Image your want detect
"""
img = cv2.imread('images/Cars1.png')

"""
Preprocess the image to obtain the effective image of character
"""
Image = Find_Edge_Plate(img)
char = segment_characters(Image)

"""
Load well trained CNN Model
"""
model = LeNet()
net = torch.load('model.pkl')
net.eval()


"""
Based on the zoned image to detect which char belongs to 
"""

for i in range(len(char)):
    plt.subplot(1, len(char), i + 1)
    plt.imshow(char[i], cmap='gray')
    plt.axis('off')

    im = Image_PIL.fromarray(char[i])
    im = im.resize((28, 28))
    img_ = transforms.ToTensor()(im)
    img_ = transforms.Normalize((0.1307,), (0.3081,))(img_)
    img_ = img_.unsqueeze(0)
    with torch.no_grad():
        outputs = net(img_)
        _, predicted = torch.max(outputs.data, 1)
        output.append(characters[predicted.item()])

plt.show()
plate_number = ''.join(output)
print(plate_number)

"""
Draw it on the original Image
"""
y, x, z = img.shape[0:3]
plate_img = cv2.putText(img, plate_number,(x//3, y//2), cv2.FONT_HERSHEY_COMPLEX, 1, (255, 0, 0), 2)
plt.imshow(plate_img)
plt.show()
