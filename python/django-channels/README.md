# Django Channels Server

## Dependencies

* Python 3.6
* Redis

```
// create virtual env
python3.6 -m venv env
source env/bin/activate

// install deps
pip install -r requirements.txt
```

To run the server:

```
python3.6 manage.py runserver
```

Or using [Daphne](https://github.com/django/daphne):

```
# run worker to handle connections events
python3.6 manage.py runsworker

# run http server
daphne shootout.asgi:channel_layer
```