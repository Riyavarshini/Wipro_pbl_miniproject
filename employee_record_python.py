import os.path
class employee:
    def __init__(self,empid,ename,sal,deptno):
        self.empid = empid
        self.ename = ename
        self.sal = sal
        self.deptno = deptno

    def getid(self):
        return self.empid
    def getname(self):
        return self.ename
    def getsal(self):
        return self.sal
    def getdept(self):
        return self.deptno

    def setid(self,id):
        self.empid = empid
    def setname(self,id):
        self.ename = ename
    def setsal(self,id):
        self.sal = sal
    def setdept(self,id):
        self.deptno = deptno

def add_emp(emp):
        file = open("emp.txt","a+")
        file.write(emp.getid()+"\t"+emp.getname()+"\t"+emp.getsal()+"\t"+emp.deptno+"\n")
        file.close()
        print("Contents added to the file")

def display_emp():
    contents = []
    result = []
    print("\nEmpid \t Ename \t sal \t deptno")
    file = open("emp.txt","r")
    for line in file:
        contents.append(line)
    for line in contents:
        result.append(line)
    print(*result)
    file.close()

def separate_data():
    search = open("emp.txt","r")
    for line in search:
        rows = line.split()
        if (rows[3]=='10'):
            file1 = open("emp_10.txt","a+")
            file1.write(rows[0]+"\t"+rows[1]+"\t"+rows[2]+"\t"+rows[3]+"\n")
            file1.close()

        elif (rows[3]=='20'):
            file2 = open("emp_20.txt","a+")
            file2.write(rows[0]+"\t"+rows[1]+"\t"+rows[2]+"\t"+rows[3]+"\n")
            file2.close()

        elif (rows[3]=='30'):
            file3 = open("emp_30.txt","a+")
            file3.write(rows[0]+"\t"+rows[1]+"\t"+rows[2]+"\t"+rows[3]+"\n")
            file3.close()
            
    search.close()
    print("Task completed")
    
def isunique(empid):
    if(os.path.isfile("/Users/suryaprasad/Desktop/riya/TM-03_python/emp.txt")==True):
        result = 0
        file = open("emp.txt","r")
        for line in file:
            rows = line.split()
            if(rows[0] == empid):
                result = 1
                break
        return(result)
    else:
        return 0

def check(sal,deptno):
    flag = 0
    if(int(sal) <= 3000):
        flag = 1
        
    if(int(deptno) < 10 or int(deptno) > 30):
        flag = flag+2
        
    return(flag)

try:        
    while True:
        print(" Main Menu ")
        print(" Enter 1 to add new employee ")
        print(" Enter 2 to display employees record")
        print(" Enter 3 to Separate data from employees record")
        print(" Enter 4 to exit ")

        choice = eval(input("enter your choice:"))
        if(choice == 1):
            empid = input("Enter unique id number = ")
            if(int(empid)<100):
                print("employee id must be greater than or equal to 3 digit")
            else:
                result=isunique(empid)
                if(result == 1):
                    print("Employee id already exists")
                    continue
    
            ename = input("Enter employee name = ").lower()
            sal = input("Enter salary = ")
            deptno = input("Enter department number = ")
            flag = check(sal,deptno)
            if(flag == 0):
               emp = employee(empid,ename,sal,deptno)
               add_emp(emp)
            elif (flag == 1):
                print("Salary must be greater than 3000")
            elif (flag == 2):
                print("Invalid department number")
            else:
                print("salary must be > 3000 and invalid department number")
        

        elif(choice == 2):
            print("Employees record:")
            display_emp()

        elif(choice == 3):
            print("initializing the task to separate data")
            separate_data()
        
        else:
            break
except Exception as e:
    print(e)
