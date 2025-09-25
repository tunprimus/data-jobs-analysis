#!/usr/bin/env python3
import httpimport
import matplotlib.pyplot as plt
import numpy as np
import os
import seaborn as sns
import sqlite3
import sys
import warnings

try:
    import fireducks.pandas as pd
except ImportError:
    import pandas as pd
    pd.set_option("mode.copy_on_write", True)

from dotenv import load_dotenv
from IPython.core.display import HTML
from IPython.display import display
from matplotlib import rcParams
from os.path import expanduser, realpath
from pprint import pprint

load_dotenv(".env")

# Define constants
GOLDEN_RATIO = 1.618033989
FIG_WIDTH = 12
FIG_HEIGHT = FIG_WIDTH / GOLDEN_RATIO
FIG_SIZE = (FIG_WIDTH, FIG_HEIGHT)
FIG_DPI = 72
RANDOM_SAMPLE_SIZE = 13
RANDOM_SEED = 42
ALPHA_VALUE = 0.05

# Set the Git repo URL and the name of the modules to import
gitlab_repo_username = "tunprimus"
gitlab_repo_target = "snippets_n_gists"
gitlab_repo_branch = "main"
module_names = ["load_sqlite_tables_without_knowing_names", "multi_rdbm_executor", "standardise_column_names", "timing_function"]

try:
    with httpimport.gitlab_repo(gitlab_repo_username, gitlab_repo_target, ref=gitlab_repo_branch):
        from data_utils.load_sqlite_tables_without_knowing_names import read_all_sqlite_tables
        from data_utils.multi_rdbm_executor import create_sql_connection, execute_on_database
        from data_utils.standardise_column_names import standardise_column_names
        from data_utils.timing_function import timing_function
except (ModuleNotFoundError, ImportError):
    try:
        sys.path.append(realpath(expanduser("../../../../snippets_n_gists/data_utils")))

        from load_sqlite_tables_without_knowing_names import read_all_sqlite_tables
        from multi_rdbm_executor import create_sql_connection, execute_on_database
        from standardise_column_names import standardise_column_names
        from timing_function import timing_function
    except (ModuleNotFoundError, ImportError):
        raise("Failed to import module from both online and offline sources.")

warnings.filterwarnings("ignore")


### Some utility functions
def table_snapshot(
    table_name,
    db_path="",
    db_type="sqlite",
    host_name=None,
    user_name=None,
    user_password=None,
    db_port=None,
    db_name=None,
):
    """
    Displays a snapshot of a given table.

    Parameters
    ----------
    table_name : str
        The name of the table to fetch data from.
    db_path : str, optional
        The file path to the SQLite database. Defaults to empty string.
    db_type : str, optional
        The type of the database to connect to. Options include 'sqlite', 'mysql', 'postgres', 'oracle', 'mssql'.
        Defaults to "sqlite".
    host_name : str, optional
        The hostname of the database server for non-SQLite databases.
    user_name : str, optional
        The username for authentication for non-SQLite databases.
    user_password : str, optional
        The password for authentication for non-SQLite databases.
    db_port : int, optional
        The port number for connecting to non-SQLite databases.
    db_name : str, optional
        The name of the database to connect to for non-SQLite databases.

    Returns
    -------
    None

    Raises
    ------
    ValueError
        If an invalid database type is provided.
    """
    df_temp = pd.DataFrame(
        execute_on_database(
            db_path, sql_query=f"SELECT * FROM {table_name} LIMIT 5", messages=False
        )
    )
    display(df_temp)


@timing_function
def display_table_exec_result(
    table_name,
    db_path="",
    db_type="sqlite",
    host_name=None,
    user_name=None,
    user_password=None,
    db_port=None,
    db_name=None,
    query_to_exec=None,
    return_df=False,
):
    """
    Displays the result of a query on a given table.

    Parameters
    ----------
    table_name : str
        The name of the table to query.
    db_path : str, optional
        The path to the database. Defaults to "".
    db_type : str, optional
        The type of database. Defaults to "sqlite".
    host_name : str, optional
        The host name of the database. Defaults to None.
    user_name : str, optional
        The username to use for the database connection. Defaults to None.
    user_password : str, optional
        The password to use for the database connection. Defaults to None.
    db_port : str, optional
        The port to use for the database connection. Defaults to None.
    db_name : str, optional
        The name of the database. Defaults to None.
    query_to_exec : str, optional
        The query to execute on the database. Defaults to None.
    return_df : boolean, optional
        If True, returns the DataFrame after displaying it.

    Returns
    -------
    None
    """
    if not query_to_exec:
        query_to_exec = f"SELECT * FROM {table_name} LIMIT {RANDOM_SAMPLE_SIZE}"
    df_temp = pd.DataFrame(
        execute_on_database(
            db_path=db_path,
            db_type=db_type,
            host_name=host_name,
            user_name=user_name,
            user_password=user_password,
            db_port=db_port,
            db_name=db_name,
            sql_query=query_to_exec,
            messages=False,
        )
    )
    if df_temp.empty:
        print("No data returned!")
        return
    display(df_temp)
    if return_df:
        return df_temp
