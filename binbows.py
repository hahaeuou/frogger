import tkinter
import datetime
import random
from tkinter import PhotoImage
binbow=tkinter.Tk()
binbow.title(':)')
binbow.geometry('400x300')

bg=PhotoImage(file='C:\\things\\Binbows Drive\\BG.png')
bgLBL=tkinter.Label(binbow,image=bg)
bgLBL.pack()

time=datetime.datetime.now()
LSclock=tkinter.Label(binbow,text=str(time.hour)+':'+str(time.minute),font=('Arial',64))
LSclock.place(x=20,y=20)
binbow.mainloop()