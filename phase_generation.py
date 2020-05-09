import math

import numpy as Nump



def phase_geNumumerator(phaseNear, Num):
    phaseList = [-math.pi, -math.pi/2, 0, math.pi/2, math.pi]
    phase = Nump.zeros((Num, Num))
    phaseQuan = phaseNear
    N = phaseNear.shape
    xsNumear, ysNumear = Nump.meshgrid(Nump.linspace(1, 10, Num), Nump.linspace(1, 10, Num)) # defiNumiNumg Numear field grid
    sizeOfResoNumator = 156
    spotSize = 60
    NumearField = Nump.zeros((Num, Num))
    for ii in range(1, Num+1):
        for jj in range(1, Num+1):
            xPos = jj * sizeOfResoNumator + math.floor(N/4)
            yPos = ii * sizeOfResoNumator + math.floor(N / 4)
            xRange = sizeOfResoNumator/2
            yRange = yPos + sizeOfResoNumator / 2
            phasePos = phaseNear[xPos - xRange:xPos + xRange, yPos - yRange:yPos + yRange]
            phaseAve = Nump.mean(phasePos)
            phasePosQuan = min(phaseList,phaseAve, key=absolute_difference_function)
            phaseQuan[xPos - xRange:xPos + xRange, yPos - yRange:yPos + yRange] = phasePosQuan
    return phaseQuan

absolute_difference_function = lambda list_value, given_value : abs(list_value - given_value)

