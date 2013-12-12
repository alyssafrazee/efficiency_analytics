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

or

`python analyze_efficiency.py --email <EMAIL> --folder <FOLDER> --limit <LIMIT> --outfile <OUTFILE>` 

where:
- `<EMAIL>` is your email address (e.g., `myemail@gmail.com`)

- `<ALIAS>` is the address to which all your "Job Complete!" emails have been sent (e.g., `myemail+projectname@gmail.com`).  

- `<FOLDER>`is the folder (i.e. label, in gmail) where you've stored all your "Job Complete!" emails

- `<LIMIT>` is the maximum number of messages to retrieve.  Defaults to 1000.

- `<OUTFILE>` is the file where the runtime, memory use, and exit status of your batch jobs will be written.  This will be a tab-separated file with columns `jobid`, `node`, `walltime` (hours), `systime` (minutes), `memory`, `memunit` (e.g. `G` for gigabytes, `M` for megabytes, etc), and `status`.

Note: you should provide exactly one of `<ALIAS>` and `<FOLDER>`.  The script exits with error if none are provided, and if both are provided, `<ALIAS>` is used by default.

## license
MIT



