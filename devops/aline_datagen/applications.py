'''generates and submits randomly generated applications to the application'''
import os
import requests
from random import randint
from util import send_post

#from .users import generate_member_user, create_user

def generate_account_application(*applicants):
    """generates and returns an object representing a valid checking/saving account application,
    takes any number of applicants as an argument"""
    application_types = ["CHECKING", "SAVINGS", "CHECKING_AND_SAVINGS"]
    app_type = application_types[randint(0,2)]
    application = {
        "applicationType": app_type,
        "noNewApplicants": False,
        "applicants": applicants,
    }
    return application

def generate_credit_card_application(*applicants):
    '''generates and returns an application for a credit card, takes any number of applicants'''
    application = {
        "applicationType": "CREDIT_CARD",
        "noNewApplicants": False,
        "applicants": applicants,
        "cardOfferId": randint(1, 4)
    }
    return application

def generate_loan_application(account_num, applicants):
    """generates and returns an object representing a valid loan application,
   takes an account number and an array of applicant info
   as would be returned by the API (includes IDs)"""
    applicant_ids = [applicant['id'] for applicant in applicants]
    loan_types = ["PERSONAL", "AUTO", "HOME", "BUSINESS", "SECURE"]
    loan_type = loan_types[randint(0,4)]
    application = {
        "applicationType": "LOAN",
        "noNewApplicants": True,
        "loanType": loan_type,
        "applicantIds": applicant_ids,
        "applicants": applicants,
        "depositAccountNumber": account_num,
        "applicationAmount": randint(1000, 1000000)
    }
    return application


def submit_application(application, token=''):
    """Sends a post request to the service to submit a created application."""
    # Retrieve the port from environment variables, default to '80' if not set
    port = os.getenv('SVC_PORT', '80')

    # Assuming 'APP_HOST' is your environment variable for the host address
    host = os.getenv('APP_HOST', 'localhost')

    # Construct the headers with the provided token, if any
    headers = {"Authorization": f"Bearer {token}"} if token else {}

    # Send the post request using the 'send_post' function from your utilities
    response = send_post(f'http://{host}:{port}/applications', application, headers)

    # Return the response object
    return response


