from django.urls import path
from . import views

urlpatterns=[
    path('',views.login,name='login'),
    path('Registration',views.Registration,name='Registration'),
    path('Forgot_Password',views.Forgot_Password,name='Forgot_Password'),
    path('Home',views.Home,name='Home'),
    path('Forgot_Password/Password_Reset',views.Password_Reset,name='Password_Reset'),
    path('Home/Dashboard',views.Dashboard,name='Dashboard'),
    path('Home/Search',views.Search,name='Search'),
    path('Home/Search/Profile',views.Profile,name='Profile'),
    path('Home/message',views.message,name='message'),
    path('Home/Report',views.Report,name='Report'),
    path('Home/Leave_Application',views.Leave_Application,name='Leave_Application'),
    path('Home/Leave_Application/Approval',views.Approval,name='Approval'),
]