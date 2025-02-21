from django.urls import path
from . import views

urlpatterns=[
    path('',views.login,name='login'),
    path('Registration',views.Registration,name='Registration'),
    path('Forgot_Password',views.Forgot_Password,name='Forgot_Password'),
]