import os

from flask import Flask


def create_app(test_config=None):
    # Create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev'
    )

    if test_config is None:
        # Load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # Load the test config if passed in
        app.config.from_mapping(test_config)

    # Ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # A simple API to test
    @app.route('/test')
    def hello():
        return 'The server is live!'

    # Import and register the auth blueprint from the factory
    from . import auth
    app.register_blueprint(auth.bp)

    # Import and register the data_storage blueprint from the factory
    from . import data_storage
    app.register_blueprint(data_storage.bp)
    app.add_url_rule('/', endpoint='index')

    return app
