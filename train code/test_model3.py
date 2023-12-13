import cv2
import dlib
import matplotlib.pyplot as plt

# Load the pre-trained facial landmark predictor
predictor_path = "shape_predictor_68_face_landmarks.dat"  # Download from http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2
predictor = dlib.shape_predictor(predictor_path)

# Load the image
image_path = "acne/00022.png"
img = cv2.imread(image_path)
img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)

# Convert the image to grayscale for facial landmark detection
gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

# Detect faces in the image
detector = dlib.get_frontal_face_detector()
faces = detector(gray)

# Loop over detected faces
for face in faces:
    # Get the facial landmarks
    landmarks = predictor(gray, face)

    # Extract coordinates of eyes, nose, and mouth
    left_eye = landmarks.part(36).x, landmarks.part(36).y, landmarks.part(39).x, landmarks.part(39).y
    right_eye = landmarks.part(42).x, landmarks.part(42).y, landmarks.part(45).x, landmarks.part(45).y
    nose = landmarks.part(30).x, landmarks.part(30).y
    mouth = landmarks.part(48).x, landmarks.part(48).y, landmarks.part(54).x, landmarks.part(54).y

    # Draw rectangles around eyes, nose, and mouth
    cv2.rectangle(img_rgb, (left_eye[0], left_eye[1]), (left_eye[2], left_eye[3]), (255, 0, 0), 2)
    cv2.rectangle(img_rgb, (right_eye[0], right_eye[1]), (right_eye[2], right_eye[3]), (255, 0, 0), 2)
    cv2.rectangle(img_rgb, (nose[0], nose[1]), (nose[0] + 1, nose[1] + 1), (255, 0, 0), 2)
    cv2.rectangle(img_rgb, (mouth[0], mouth[1]), (mouth[2], mouth[3]), (255, 0, 0), 2)

# Display the image with rectangles around facial features
plt.imshow(img_rgb)
plt.title('Facial Features')
plt.axis('off')
plt.show()
