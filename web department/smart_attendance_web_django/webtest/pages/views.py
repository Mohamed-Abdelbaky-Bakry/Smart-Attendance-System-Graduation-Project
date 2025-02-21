from django.shortcuts import render

def login(request):
    return render(request,'pages/login.html')

def Registration(request):
    return render(request,'pages/Registration.html')

def Forgot_Password(request):
    return render(request,'pages/Forgot_Password.html')