from django.shortcuts import render

def login(request):
    return render(request,'pages/login.html')

def Registration(request):
    return render(request,'pages/Registration.html')

def Forgot_Password(request):
    return render(request,'pages/Forgot_Password.html')

def Home(request):
    return render(request,'pages/Home.html')

def Password_Reset(request):
    return render(request, 'pages/Password_Reset.html')

def Dashboard(request):
    return render(request, 'pages/Dashboard.html')

def Search(request):
    return render(request, 'pages/Search.html')

from django.shortcuts import render

from django.shortcuts import render

def Profile(request):
    student = {
        "id": 123456780,
        "name": "Ali Khattab",
        "department": "Civil Department",
        "year": "Fourth Year",
        "photo_url": "https://storage.googleapis.com/a1aa/image/gC4fdRVK-PE_HJVJYbDJdpf3gqoV8wdwb1dBryXUgck.jpg",
        "attendance": 19,
        "total_classes": 20,
        "leaves": 1,
        "performance": 95,  # Performance percentage
        "subject": "Database",
        "email": "123456780@shosa.edu.eg",
        "phone": "+20 123456789",
    }

    # Fix: Compute stroke-dashoffset in Python
    student["performance_offset"] = 282.6 * (1 - student["performance"] / 100)

    return render(request, "pages/Profile.html", {"student": student})



def message(request):
    return render(request, 'pages/message.html')

def Report(request):
    return render(request, 'pages/Report.html')

def Leave_Application(request):
    return render(request, 'pages/Leave_Application.html')

def Approval(request):
    return render(request, 'pages/Approval.html')