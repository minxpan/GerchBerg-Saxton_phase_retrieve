import cv2

import matplotlib.pyplot as plt
import numpy as np
import scipy.io as sio

from gsAmplitudeRetrieve import iterGerchbergSaxton2

imgFar = cv2.imread('bar_10by10.png', cv2.IMREAD_GRAYSCALE)
imgFar = imgFar.astype(float)
imgFar = np.asarray(imgFar, float)

max_iters = 500000

x = sio.loadmat('Phase.mat')
phase_near = x['Phase']
amp_far = iterGerchbergSaxton2(imgFar, phase_near, max_iters)

original = amp_far*np.exp(phase_near * 1j)
recovery = np.fft.fft2(original)
recoveryIntensity = np.absolute(recovery) ** 2

plt.figure(1)
plt.tight_layout()
plt.subplot(223)
plt.imshow(recoveryIntensity)
plt.title('Desired image')

plt.subplot(224)
# plt.imshow(phase_far)
plt.title('Phase Far Field')

plt.subplot(221)
plt.imshow(abs(original))
plt.title('Intensity Near Field')

plt.subplot(222)
plt.imshow(phase_near)
plt.title('Phase Near Field')

plt.show()

sio.savemat('20by20_letterA3_amp.mat', {
            'recovered': recovery, 'original': original})
