<h1>ChatApplication</h1>

<h2>Overview</h2>

<p>ChatApplication is a web-based chat platform that allows users to communicate in real-time. The application is built using a combination of front-end and back-end technologies and incorporates a MySQL database for storing user and message data.</p>

<h2>Features</h2>

<ul>
  <li>Real-time messaging functionality</li>
  <li>User authentication and session management</li>
  <li>Responsive design for seamless usage on desktop and mobile devices</li>
  <li>Chat room creation and management</li>
  <li>User-friendly interface</li>
  <li>Database integration for secure and efficient data storage</li>
</ul>

<h2>Technologies Used</h2>

<ul>
  <li>HTML: For structuring the web pages</li>
  <li>CSS: For styling the application</li>
  <li>JavaScript: For interactivity and client-side functionality</li>
  <li>XML: For data transport (if applicable)</li>
  <li>PHP: For server-side processing</li>
  <li>MySQL: For database management</li>
</ul>

<h2>Installation</h2>

<h3>Prerequisites</h3>

<ul>
  <li>A web server like Apache or Nginx</li>
  <li>PHP installed on your server</li>
  <li>MySQL database setup</li>
</ul>

<h3>Steps</h3>

<ol type = "1">
  <li>Clone the repository to your local machine:<br> git clone https://github.com/leoGoD10/Chat-Application.git</li>
   <li>Navigate to the project directory:<br> cd chatapplication</li>
   <li>Import the database:<br> 
     <ul>
       <li>Locate the SQL file (e.g., chatapp.sql) in the project folder.</li>
       <li>Use a tool like phpMyAdmin or MySQL CLI to import the file:<br> mysql -u (username) -p (database_name)  chatapp.sql</li>
     </ul>
   </li>
   <li>Configure the database connection:<br> 
   <ul>
     <li>Open the config.php file.</li>
     <li>Update the database credentials (host, username, password, database name) to match your setup.</li>
   </ul>
   </li>
   <li>Start the application:<br> 
     <ul>
       <li>If using XAMPP, move the project folder to the htdocs directory.</li>
        <li>Access the application in your browser at http://localhost/chatapplication.</li>
     </ul>
   </li>
</ol>
