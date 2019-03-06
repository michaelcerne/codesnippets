import time
import serial
import pyaudio
import wave
import audioop
import random
import aubio
import numpy as num

rmsp = 0
isBlacked = False

def blackOutColor():
  ser.write(('#000000' + '\r\n').encode('ascii'))

def changeColor():
  r = lambda: random.randint(0,255)
  c = '%02X%02X%02X' % (r(),r(),r())
  ser.write((c + '\r\n').encode('ascii'))
  print(c)
  return c

ser = serial.Serial(
    port='COM3',
    baudrate=9600,
    parity=serial.PARITY_NONE,
    stopbits=serial.STOPBITS_ONE,
    bytesize=serial.EIGHTBITS,
    timeout=1,
    xonxoff=0,
    rtscts=0
)

print("Opened: " + str(ser.is_open))

p = pyaudio.PyAudio()

# Open stream.
stream = p.open(format=pyaudio.paFloat32,
    channels=1, rate=44100, input=True,
    frames_per_buffer=1024)

# Aubio's pitch detection.
pDetection = aubio.onset("default", 2048,
    2048//2, 44100)
# Set unit.
#pDetection.set_unit("Hz")
pDetection.set_silence(-40)

while True:

    data = stream.read(1024)
    samples = num.fromstring(data,
        dtype=aubio.float_type)
    pitch = pDetection(samples)[0]
    # Compute the energy (volume) of the
    # current frame.
    volume = num.sum(samples**2)/len(samples)
    # Format the volume output so that at most
    # it has six decimal numbers.

    #print(pitch)
    #print(volume)

    if volume > 0.000001:
      if pitch > 0.01:
        changeColor()
    else:
      blackOutColor()

stream.stop_stream()
stream.close()
p.terminate()
