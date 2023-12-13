import tensorflow as tf
from tensorflow.keras import layers, models

# Define a simple model (example architecture)
model = models.Sequential(
    [
        layers.Conv2D(32, (3, 3), activation="relu", input_shape=(224, 224, 3)),
        layers.MaxPooling2D((2, 2)),
        layers.Flatten(),
        layers.Dense(64, activation="relu"),
        layers.Dense(3, activation="softmax"),  # Assuming 3 output classes
    ]
)

# Compile the model
model.compile(
    optimizer="adam",
    loss="sparse_categorical_crossentropy",  # Use 'categorical_crossentropy' for one-hot encoded labels
    metrics=["accuracy"],
)

# Generate some example data (replace this with your actual data loading)
train_images = 'test_image.jpeg'  # Your training images
train_labels = 'acne_test'  # Your training labels

# Train the model
model.fit(train_images, train_labels, epochs=5)  # Adjust the number of epochs as needed

# Save the entire model to a directory
model.save("saved_model")
