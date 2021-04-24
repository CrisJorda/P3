import matplotlib.pyplot as plt
import soundfile as sf 
import numpy as np 

plt.figure(1)
senyalwav, fmwav = sf.read('PAV_2310_0.wav')
twav = np.arange(0, len(senyalwav))/fmwav
plt.plot(twav, senyalwav)
plt.show()

plt.figure(2)
senyalau, fmau = sf.read('sox-PAV_2310_0.au')
tau = np.arange(0, len(senyalau))/fmau
plt.plot(tau, senyalau)
plt.show()

plt.figure(3)
fig, axs = plt.subplots(2)
fig.suptitle('Original vs sox')
axs[0].plot(twav, senyalwav)
axs[0].set_title('Original .wav file')
axs[1].plot(tau, senyalau)
axs[1].set_title('Modified .au file')
plt.show()