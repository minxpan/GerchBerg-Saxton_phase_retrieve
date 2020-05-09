import cv2
from phase_retrieval_GS import *
from phase_retrieval_GS2 import *
import matplotlib.pyplot as plt
import numpy as np
import scipy.io as sio

imgNear = cv2.imread("A_Near.png", cv2.IMREAD_GRAYSCALE)
imgNear = imgNear.astype(float)
imgNear = np.asarray(imgNear, float)

imgFar = cv2.imread('A_Far.png', cv2.IMREAD_GRAYSCALE)
imgFar = imgFar.astype(float)
imgFar = np.asarray(imgFar, float)

max_iters = 200
phase_far, phase_near = gerSaxAlgo2(imgFar, max_iters)

original = np.exp(phase_near * 1j)
recovery = np.fft.fft2(original)
recoveryIntensity = np.absolute(recovery) ** 2

plt.figure(1)
plt.tight_layout()
plt.subplot(223)
plt.imshow(recoveryIntensity)
plt.title('Desired image')

plt.subplot(224)
plt.imshow(phase_far)
plt.title('Phase Far Field')

plt.subplot(221)
plt.imshow(abs(original))
plt.title('Intensity Near Field')

plt.subplot(222)
plt.imshow(phase_near)
plt.title('Phase Near Field')

plt.show()

sio.savemat('6by6_500.mat', {'recovered': recovery, 'original': original})
