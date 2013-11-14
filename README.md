Analyzing computation time/memory use of SGE batch jobs
====================

The motivation/details for this project are explained in [this blog post](http://alyssafrazee.com/efficiency-analytics.html).

## dependencies
The Python script provided depends on [ContextIO](https://github.com/contextio/Python-ContextIO) - installation instructions are available at the provided link.  You will need a ContextIO API key, and you'll need to associate your email account with that ContextIO API key.

When you have your API key, create a file (in the same folder as `analyze_efficiency.py`) called `client_secrets` and format it as follows (separator is a tab character):

```
CONSUMER_KEY    <keyhere>
CONSUMER_SECRET <secrethere>
```

## usage
From the command line, run:

`python analyze_efficiency.py --email <EMAIL> --alias <ALIAS> --limit <LIMIT> --outfile <OUTFILE>`

where:
- <EMAIL> is your email address (e.g., `myemail@gmail.com`)

- <ALIAS> is the address to which all your "Job Complete!" emails have been sent (e.g., `myemail+projectname@gmail.com`).  Support for filters other than alias is in development :) 

- <LIMIT> is the maximum number of messages to retrieve.  Defaults to 1000.

- <OUTFILE> is the file where the runtime and memory use of your batch jobs will be written

## license
MIT



