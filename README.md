# redirects
## Purpose

This repository contains a simple Docker container image build with the express purpose of redirecting traffic from one location to another using an Apache web server to perform the redirection. This is a newer iteration of a service which was performed using a apache server on an EC2 server.

# Requirements

This build is meant to be part of a pipeline created and maintained using the infrastructure repository redirects-blueprints. For information on how it is used, see the README file for that repository.

# Redirections performed

The Apache configuration file contains all redirections performed. Information on when the rule was added is listed in that file. 

The reasons behind the need for the redirection are many and varied. Usually they are created at the time a service is retired or moved to another platform. Because it is difficult to know how long such redirection might be needed by users, many of these continue on for very long times.
