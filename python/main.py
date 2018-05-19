import time
import serial
import pyaudio
import wave
import audioop
import random

rmsp = 0
isBlacked = False

def blackOutColor():
  ser.write(('#000000' + '\r\n').encode('ascii'))

def changeColor():
  r = lambda: random.randint(0,255)
  c = '#%02X%02X%02X' % (r(),r(),r())
  ser.write((c + '\r\n').encode('ascii'))
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

CHUNK = 1024
FORMAT = pyaudio.paInt16
CHANNELS = 2
RATE = 44100

p = pyaudio.PyAudio()

stream = p.open(format=FORMAT,
                channels=CHANNELS,
                rate=RATE,
                input=True,
                frames_per_buffer=CHUNK)

while True:
    data = stream.read(CHUNK)
    rms = audioop.rms(data, 2)
    rmsd = rms - rmsp
    if ((rmsd * 1.5) >= rmsp):
      print("LED Color: \"" + changeColor() + "\" RMS Change Value: \"" + str(rmsd).zfill(4) + "\"", end="\n")
    print("Current: " + str(rms) + " Previous: " + str(rmsp))
    rmsp = rms
    
    

stream.stop_stream()
stream.close()
p.terminate()