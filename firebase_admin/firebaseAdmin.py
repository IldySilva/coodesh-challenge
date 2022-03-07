
from datetime import datetime
from firebase_admin import credentials,storage
import firebase_admin
import json

import os
from firebase_admin import firestore
cred = credentials.Certificate('./firebase_Admin/firebasekey.json')

firebase_admin.initialize_app(cred, {'storageBucket': 'coodesh-68329.appspot.com'})
db = firestore.client()
productsCollection=db.collection("products")
bucket = storage.bucket()


def addJsonToFirebase():
    print("Adicionando Json ao Firebase")
    with open('./firebase_admin/products.json', 'r') as f:
        data = json.load(f)
        for c in data:
            c["upload_date"]=datetime.now().isoformat()
            productsCollection.add(c)
    print("conluido")



def uploadFotos():
    print("fazendo upload das fotografias")
    arr = os.listdir('assets/images')
    for c in arr:
        bucket = storage.bucket()
        blob = bucket.blob("assets/images/"+c)
        blob.upload_from_filename("assets/images/"+c)
    print("conluido")
    
def addLinksToDocs():
    print("actualizando link nos documentos")
    for c in range(50):
        blob = bucket.blob("assets/images/"+str(c)+".jpg")
        doc=db.collection("products").where("filename","==" ,str(c)+".jpg").get()
        if doc:
            db.collection("products").document(doc[0].id).update({"photo_url":blob.generate_signed_url(expiration=datetime(2022,10,10))})
    print("conluido")




addJsonToFirebase()
##uploadFotos()
addLinksToDocs()
