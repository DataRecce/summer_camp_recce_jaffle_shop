# Coding Steps Taken
git clone https://github.com/DataRecce/summer_camp_recce_jaffle_shop.git

# generate virtual environment, so we can run duckdb & dbt locally
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python3 -m pip install --upgrade pip

# compile the dbt project and associated files
dbt build
dbt docs generate # important for later
dbt docs serve # opens in browser a documentation site
dbt test

# install recce
pip install recce



# I've separated out the yml and documentation files from a single schema. i think that is poor practice.
# By putting the yml & model files together, it makes it easier to find the files you need to edit.
# Especially if you have a lot of models and you want to make changes to the schema.
# For this example, it will be easier to show tests for each file as well.

