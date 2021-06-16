import sys
import sqlite3
from PyQt5.QtWidgets import QApplication
from PyQt5.QtWidgets import QFormLayout,QHBoxLayout
from PyQt5.QtWidgets import QLineEdit,QLabel,QPushButton
from PyQt5.QtWidgets import QWidget
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QIntValidator,QDoubleValidator,QFont
app = QApplication(sys.argv)
import sqlite3
def getdata():
    global l
    l=[]
    data = conn.execute("select * from student")
    for i in data:
        m=[]
        m.append(i[0])
        m.append(i[1])
        m.append(i[2])
        m.append(i[3])
        l.append(m)

def nextclicked():
    global count
  
    global l,name,rollnum,address
    if count< len(l)-1:
        count+=1
        name.setText(l[count][1])
        rollnum.setText(str(l[count][3]))
        address.setText(l[count][2])
def prevclicked():
    global count
    
    global l,name,rollnum,address
    if count >0:
        count-=1
        name.setText(l[count][1])
        rollnum.setText(str(l[count][3]))
        address.setText(l[count][2])   

def clrclicked():
    global l,name,rollnum,address
    name.clear()
    rollnum.clear()
    address.clear()
def addclicked():
    global conn,l,name,rollnum,address
    n=name.text()
    r=rollnum.text()
    a=address.text()
    if n!='' and r!='' and a!='':
        conn.execute("insert into student values(?,?,?,?)",(len(l)+1,n,a,int(r)))
        conn.commit()

    getdata()
def updateclicked():
    global conn,l,name,rollnum,address
    n=name.text()
    r=rollnum.text()
    a=address.text()
    i=l[count].index(int(r))
    print(i)
    if n!='' and r!='' and a!='':
        conn.execute("update student set name=?,rollnum=?,address=? where rollnum=?",(n,int(r),a,int(r)))
        conn.commit()
    getdata() 
def deleteclicked():
    global conn,l,name,rollnum,address
    n=name.text()
    r=rollnum.text()
    a=address.text()
   
    if n!='' and r!='' and a!='':
        conn.execute("DELETE from student where rollnum=?",(int(r),))
        conn.commit()
    getdata()    
window = QWidget()
window.setWindowTitle('QFormLayout')
conn = sqlite3.connect('student.db')
print("database opened successfully")


layout = QFormLayout()
layout2 = QHBoxLayout()
layout3 = QHBoxLayout() 
column=0
count=0
l=[]
getdata()

name = QLineEdit(l[column][1])
name.setAlignment(Qt.AlignLeft)
name.setFont(QFont("Arial",20))

namel = QLabel('Name: ')
namel.setFont(QFont("Arial",20))

rollnum = QLineEdit(str(l[column][3]))
rollnum.setAlignment(Qt.AlignLeft)
rollnum.setFont(QFont("Arial",20))

rollnuml = QLabel('Roll Number: ')
rollnuml.setFont(QFont("Arial",15))

address = QLineEdit(str(l[column][2]))
address.setAlignment(Qt.AlignLeft)
address.setFont(QFont("Arial",20))

addressl = QLabel('Address: ')
addressl.setFont(QFont("Arial",20))

addbtn = QPushButton('Add')
layout2.addWidget(addbtn)
updatebtn = QPushButton('UPDATE')
layout2.addWidget(updatebtn)
deletebtn = QPushButton('DELETE')
layout2.addWidget(deletebtn)
nextbtn = QPushButton('NEXT')
layout2.addWidget(nextbtn)
prvbtn = QPushButton('PREVIOUS')
layout2.addWidget(prvbtn)
clrbtn = QPushButton('CLEAR')
layout2.addWidget(clrbtn)

nextbtn.clicked.connect(nextclicked)
prvbtn.clicked.connect(prevclicked)
clrbtn.clicked.connect(clrclicked)
addbtn.clicked.connect(addclicked)
updatebtn.clicked.connect(updateclicked)
deletebtn.clicked.connect(deleteclicked)

layout.addRow(namel, name)
layout.addRow(rollnuml, rollnum)
layout.addRow(addressl, address)
layout.addRow(layout2)
layout.addRow(layout3)
window.setLayout(layout)
window.show()

sys.exit(app.exec_())
