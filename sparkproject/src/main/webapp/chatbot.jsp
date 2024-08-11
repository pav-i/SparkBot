<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="home.css"> <!-- Link to your existing CSS -->
    <title>Chatbot</title>
    <style>
        body {
            display: flex;
            flex-direction: column; /* Aligns content in a column */
            align-items: center; /* Centers content horizontally */
            justify-content: center; /* Centers content vertically */
            min-height: 100vh; /* Ensures full viewport height */
            margin: 0; /* Removes default margin */
            background-color: white; /* Optional: background color for the page */
            text-align: center; /* Center-aligns text */
        }

        h1 {
            margin-bottom: 20px; /* Adds space below the heading */
        }

        .iframe-container {
            width: 500px; /* Adjust the width as needed */
            height: 350px; /* Adjust the height to match the width */
             /* Maintains the circular shape */
            overflow: hidden; /* Ensures content is clipped to the circle */
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid #000; /* Optional: adds a border for visual effect */
            background-color: #fff; /* Optional: background color for the container */
        }

        .iframe-container iframe {
            width: 100%;
            height: 100%;
            border: none; /* Removes the default border */
        }
    </style>
</head>
<body>
    <!-- Integrated Circular Iframe -->
    <h1>Say hello to Walbot !</h1>
    <div class="iframe-container">
        <iframe
            allow="microphone;"
            src="https://console.dialogflow.com/api-client/demo/embedded/5771c9ed-6541-4940-bcc2-565cb4fe65c0">
        </iframe>
        
    </div>
    <footer>
        <p>&copy; 2024 Shopping Website. All Rights Reserved.</p>
    </footer>
</body>
</html>
