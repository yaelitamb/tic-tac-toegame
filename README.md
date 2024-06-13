# tic-tac-toegame
- Author: Yael Martin Benzaquen
- Group: Thursday 13:15
- Date: 13/06/2024

# Architecture
This is my first time using anything related to cloud, instances or terraform. My architecture consists on the following components:
A VPC (virtual private cloud) to work on, in this case Cloud9 with my environment created. An EC2 instance that runs the terraform with a Docker image as it was impossible for me to separate between backend and frontend. It is also configured the SSh to allow the external access to the EC2 instance and all dependencies like Docker and Nginx.

# Preview

# Reflections

What did you learn? 
I think I have learned how terraform works and gained experience in terraform scripts for deploying AWS infrastructure. For this task I also learned how to configure and manage AWS services like VPC, EC2 and the ssh with Putty. 

What obstacles did you overcome? 
I went through a lot of obstacles starting at developing the game because I had no experience in programming. Yes, it is very simple at following a tutorial, but when the tutorial ends and there is no explanation at creating and Dockerfile or separate the whole game in two parts (backend and frontend) the result is way not easy. I have spent months trying to separate the game in two and didn't reach a solution. I didn't receive any useful help through this time that is why it took me so long. At the end the only solution I could get was creating a simpler game with just css, html and js.
Apart from my problems separating the game I got some problems with the ssh as I didn't know a hidden .ssh directory already existed, so I created my own ssh folder and of course it wasn't working

Was that something that surprised you? 
It was very surprising for me the amount of work a simple app takes and the huge structure it has behind it. Deploying the application to Cloud takes a lot of knowledge and services to make everything fit in together and work properly.
