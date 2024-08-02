<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABCD123</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        textarea {
            width: 100%;
            height: 100px;
        }
        button {
            margin-top: 10px;
        }
        select {
            width: 100%;
            height: 100px;
        }
        .response {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>ABCD123</h1>
    <textarea id="jsonInput" placeholder="Enter JSON here"></textarea><br>
    <button onclick="handleSubmit()">Submit</button>
    <select id="options" multiple>
        <option value="Numbers">Numbers</option>
        <option value="Alphabets">Alphabets</option>
        <option value="Highest Alphabet">Highest Alphabet</option>
    </select>
    <div class="response" id="response"></div>

    <script>
        async function handleSubmit() {
            const jsonInput = document.getElementById('jsonInput').value;
            const responseDiv = document.getElementById('response');
            responseDiv.innerHTML = ''; // Clear previous response

            try {
                const parsedData = JSON.parse(jsonInput);
                const res = await fetch('https://your-vercel-app.vercel.app/api/bfhl', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(parsedData)
                });

                const data = await res.json();
                renderResponse(data);
            } catch (error) {
                alert('Invalid JSON or server error');
            }
        }

        function renderResponse(data) {
            const options = Array.from(document.getElementById('options').selectedOptions, option => option.value);
            const responseDiv = document.getElementById('response');
            const { numbers, alphabets, highest_alphabet } = data;

            if (options.includes('Numbers')) {
                responseDiv.innerHTML += `<p>Numbers: ${JSON.stringify(numbers)}</p>`;
            }
            if (options.includes('Alphabets')) {
                responseDiv.innerHTML += `<p>Alphabets: ${JSON.stringify(alphabets)}</p>`;
            }
            if (options.includes('Highest Alphabet')) {
                responseDiv.innerHTML += `<p>Highest Alphabet: ${JSON.stringify(highest_alphabet)}</p>`;
            }
        }
    </script>
</body>
</html>
