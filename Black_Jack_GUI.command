
#!/usr/bin/env python
from tkinter import *

#root Window
root = Tk()

def button(frame):          #Function to define a button
    b=Button(frame, padx=1, width=3, text="  X ",font=('arial',60,'bold'),relief="sunken",bd=10)
    return b

def onClick(row,col):
    print(row,col)
    pass


#creation of Label
#myLabel = Label(root, text = "hello World").grid(row=0,column=0)



#creation of Label
#myLabel2 = Label(root, text = "hi World").grid(row=1,column=0)

b = [[],[],[]]
for i in range(3):
    for j in range(3):
        b[i].append(button(root))
        b[i][j].grid(row=i,column=j)

root.mainloop()
