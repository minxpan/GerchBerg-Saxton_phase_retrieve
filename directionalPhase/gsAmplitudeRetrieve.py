import numpy as np


def iterGerchbergSaxton2(img, phase_near, max_iter):
    h, w = img.shape
    pm_s = phase_near  # angle near
    pm_f = np.random.rand(h, w)  # angle far
    am_f = np.sqrt(img)  # amplitude far
    am_s = np.random.rand(h, w)  # amplitude near

    signal_s = am_s * np.exp(pm_s * 1j)

    for ii in range(max_iter):
        print(ii)
        signal_f = np.fft.fft2(signal_s)
        pm_f = np.angle(signal_f)
        signal_f = am_f * np.exp(pm_f * 1j)
        signal_s = np.fft.ifft2(signal_f)
        # pm_s = np.angle(signal_s)
        am_s = np.abs(signal_s)
        # print(am_s)
        # pm_s = phase_geNumumerator(pm_s, 6)
        signal_s = am_s * np.exp(pm_s * 1j)

    return am_s
