# ASH

This is ASH, my Product Design GCSE NEA (non-examination-assessment) project. It is an Artificial Intelligence system designed specificity for people working from home. The frontend dart code is in `client/lib` and the backend code is in the `Server` directory.

## Running
To run the app make a clone request to the release branch the build with XCode/ Android Studio/ Linux Build Tools depending on the target platform. Then, run the built app. At the moment, the backen must be hosted with a local database. The URI of the backend also needs to be put into `client/lib/data/models/constants.dart`.

## Explaination
The backend has a PostgreSQL database and a speech model to match intents sent to it via webhook from the frontend. The frontend can run on mac, android, ios, linux and windows (although there is a build error at the moment). I plan to add docker to the backend to enable it to be run easily with the database as a docker volume. Once this has been done, it can be hosted on a cloud platform such as Heroku so `ngrok` no longer needs to be used.

## Purpose
This will be added in more detail later. Put simply, it is an AI designed for people working from home for my product design GCSE NEA.

## Contributing
As this is a school project, I will not be accpeting pull requests until after I have recieved my GCSE results. However, you are welcome to fork the repo and create your own version as long as you do not violate the license.
