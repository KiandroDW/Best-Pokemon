import os
from tkinter import Tk, Label
from PIL import Image, ImageTk
import random

folder_path = os.path.join(os.path.dirname(__file__), "images")
image_files = [f for f in os.listdir(folder_path) if f.endswith('.png')]


def display_images():
    if len(image_files) < 2:
        print("Not enough images to display. Add at least two images to the folder.")
        return

    p1 = random.choice(image_files)
    p2 = random.choice(image_files)
    while (p1 == p2):
        p2 = random.choice(image_files)

    def on_click(l1, l2, t1, t2, pwon, plost):
        file1 = open("won.txt", "a")
        file1.write(f"{pwon.replace('.png', '').capitalize()}\n")
        file1.close()

        file2 = open("lost.txt", "a")
        file2.write(f"{plost.replace('.png', '').capitalize()}\n")
        file2.close()

        nonlocal p1, p2

        p1 = random.choice(image_files)
        p2 = random.choice(image_files)
        while (p1 == p2):
            p2 = random.choice(image_files)

        # Load the first two images
        img1_path = os.path.join(folder_path, p1)
        img2_path = os.path.join(folder_path, p2)

        img1 = Image.open(img1_path)
        img1 = img1.resize((300, 300))  # Resize to 300x300
        img1_tk = ImageTk.PhotoImage(img1)

        # Open and resize the second image
        img2 = Image.open(img2_path)
        img2 = img2.resize((300, 300))  # Resize to 300x300
        img2_tk = ImageTk.PhotoImage(img2)

        l1.config(image=img1_tk)
        l2.config(image=img2_tk)
        l1.image = img1_tk
        l2.image = img2_tk

        t1.config(text=f"{p1.replace('.png', '').capitalize()}")
        t2.config(text=f"{p2.replace('.png', '').capitalize()}")

    # Load the first two images
    img1_path = os.path.join(folder_path, p1)
    img2_path = os.path.join(folder_path, p2)

    # Create the Tkinter window
    window = Tk()
    window.title("Choose favorite pokémon")
    window.geometry("650x350+100+100")

    # Open and resize the first image
    img1 = Image.open(img1_path)
    img1 = img1.resize((300, 300))  # Resize to 300x300
    img1_tk = ImageTk.PhotoImage(img1)

    # Open and resize the second image
    img2 = Image.open(img2_path)
    img2 = img2.resize((300, 300))  # Resize to 300x300
    img2_tk = ImageTk.PhotoImage(img2)

    # Display the images in the window
    label1 = Label(window, image=img1_tk)
    label1.grid(row=0, column=0, padx=10, pady=10)

    # Add text below the first image
    text1 = Label(window, text=f"{p1.replace('.png', '').capitalize()}")
    text1.grid(row=1, column=0, padx=10, pady=5)

    label2 = Label(window, image=img2_tk)
    label2.grid(row=0, column=1, padx=10, pady=10)

    # Add text below the first image
    text2 = Label(window, text=f"{p2.replace('.png', '').capitalize()}")
    text2.grid(row=1, column=1, padx=10, pady=5)

    label1.bind("<Button-1>", lambda event: on_click(label1, label2, text1, text2, p1, p2))
    label2.bind("<Button-1>", lambda event: on_click(label1, label2, text1, text2, p2, p1))
    text1.bind("<Button-1>", lambda event: on_click(label1, label2, text1, text2, p1, p2))
    text2.bind("<Button-1>", lambda event: on_click(label1, label2, text1, text2, p2, p1))
    window.bind("<Left>", lambda event: on_click(label1, label2, text1, text2, p1, p2))
    window.bind("<Right>", lambda event: on_click(label1, label2, text1, text2, p2, p1))

    # Keep references to avoid garbage collection
    label1.image = img1_tk
    label2.image = img2_tk

    # Start the Tkinter event loop
    window.mainloop()

if __name__ == "__main__":
    display_images()
