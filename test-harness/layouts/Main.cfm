﻿<cfoutput>
    <!doctype html>
    <html lang="en">
        <head>
            <!-- Required meta tags -->
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Module Tester</title>

            <script type="application/ld+json">
            #runEvent(
                event = "schemas.index",
                eventArguments = {
                    eventName = event.getCurrentEvent(),
                    routedUrl = event.getCurrentRoutedUrl()
                }
            )#
            </script>

            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

            <!-- Bootstrap Icon library -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" integrity="sha384-He3RckdFB2wffiHOcESa3sf4Ida+ni/fw9SSzAcfY2EPnU1zkK/sLUzw2C5Tyuhj" crossorigin="anonymous">

            
        </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1>Schema-Org Test Harness</h1>
                    <cfdump var="#rc#" label="Request Collection">
                    <cfdump var="#prc#" label="Private Request Collection">
                    <cfdump var="#event.getCurrentRoutedUrl()#" label="Private Request Collection">
                </div>
            </div>
        </div>

        <!-- Bootstrap Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </body>
    </html>
</cfoutput>