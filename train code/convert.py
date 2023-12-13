import tensorflow as tf

saved_model_dir = 'acne/saved_model/my_model'

# Load the labels
labels = ["Low", "Moderate", "Severe"]  # Replace this with your actual list of labels

# Convert the model
converter = tf.lite.TFLiteConverter.from_saved_model(saved_model_dir)
tflite_model = converter.convert()

# Save the model
with open("model.tflite", "wb") as f:
    f.write(tflite_model)

# Save the labels to a text file
with open("labels.txt", "w") as f:
    f.write("\n".join(labels))
