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

def Profile(request):
    return render(request, 'pages/Profile.html')

def message(request):
    return render(request, 'pages/message.html')

def Report(request):
    return render(request, 'pages/Report.html')

def Leave_Application(request):
    return render(request, 'pages/Leave_Application.html')

def Approval(request):
    return render(request, 'pages/Approval.html')