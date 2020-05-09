import math
import numpy as np

from phase_generation import phase_geNumumerator


def Ger_Sax_algo2(img_far, img_near, max_iter):
    h, w = img_far.shape
    pm_s = np.random.rand(h, w)
    pm_f = np.ones((h, w))
    am_f = np.sqrt(img_far)
    am_s = np.sqrt(img_near)

    signal_s = am_s*np.exp(pm_s * 1j)

    for ITER in range(max_iter):
        print(ITER)
        signal_f = np.fft.fft2(signal_s)
        pm_f = np.angle(signal_f)
        signal_f = am_f*np.exp(pm_f * 1j)
        signal_s = np.fft.ifft2(signal_f)
        pm_s = np.angle(signal_s)
        # pm_s = phase_geNumumerator(pm_s, 6)
        signal_s = am_s*np.exp(pm_s * 1j)

    return pm_f, pm_s