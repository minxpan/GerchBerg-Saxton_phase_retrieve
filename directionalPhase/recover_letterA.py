
import cv2
import numpy as np
from scipy.io import loadmat
import matplotlib.pyplot as plt
from gsAmplitudeRetrieve import iterGerchbergSaxton2
import scipy.io as sio

imgFar = cv2.imread('letterA3.png', cv2.IMREAD_GRAYSCALE)
imgFar = imgFar.astype(float)
imgFar = np.asarray(imgFar, float)

max_iters = 2000

x = loadmat('Phase.mat')
phaseNear = x['Phase']
imgNear, phase_far = iterGerchbergSaxton2(imgFar, phaseNear, max_iters)

original = imgNear*np.exp(phaseNear * 1j)
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
plt.imshow(phaseNear)
plt.title('Phase Near Field')

plt.show()

sio.savemat('20by20_letterA3.mat', {'recovered': recovery, 'original': original})
