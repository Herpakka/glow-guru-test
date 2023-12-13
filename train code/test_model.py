# นำโมเดลเทรนแล้วมาทดสอบ โดยตัดเฉพาะส่วนใบหน้า(rectangle)

import tensorflow as tf
import cv2
import matplotlib.pyplot as plt

print("Loading model ...")
model = tf.keras.models.load_model("acne/saved_model/my_model")

class_names = ["Low", "Moderate", "Severe"]

def load_and_prep_image(filename, img_shape=224):
    img = tf.io.read_file(filename)
    # Decode it into a tensor
    img = tf.image.decode_jpeg(img)
    # Resize the image
    img = tf.image.resize(img, [img_shape, img_shape])
    # Rescale the image (get all values between 0 and 1)
    img = img / 255.0
    return img

def detect_and_predict(image_path):
    print("Loading image ...")
    # Import the target image
    img = cv2.imread(image_path)
    img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

    # Detect faces in the image
    face_cascade = cv2.CascadeClassifier(cv2.data.haarcascades + 'haarcascade_frontalface_default.xml')
    faces = face_cascade.detectMultiScale(gray, scaleFactor=1.3, minNeighbors=5)
    
    if len(faces) == 0:
        print("No faces detected in the image.")
        return

    # Iterate over detected faces and make predictions
    for face in faces:
        # Convert x and y coordinates to integers
        x, y, w, h = face.astype(int)

        # Extract the face region from the image
        face_img = img[y:y + h, x:x + w]

        # Preprocess the face image
        face_img = cv2.resize(face_img, (224, 224))
        face_img = tf.convert_to_tensor(face_img)
        face_img = tf.expand_dims(face_img, axis=0)
        face_img = tf.cast(face_img, tf.float32) / 255.0

        # Make a prediction
        pred = model.predict(face_img)

        # Get the predicted class name
        pred_class = class_names[int(tf.argmax(pred[0]))]  # Convert tf.uint8 to int
        print("Predicted class:", pred_class)

        # Display the cropped face and predicted class
        plt.imshow(face_img.numpy().squeeze()[:,:,::-1])
        plt.title(f'Predicted class: {pred_class}')
        plt.axis('off')
        plt.show()

detect_and_predict("acne/00002.png")
