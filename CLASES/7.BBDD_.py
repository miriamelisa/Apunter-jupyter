{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "ORM_ SQL \n",
    "OBJETO RELACIONAL MAPPER"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "#Puede funcionar como mysql normal\n",
    "#para hacer CRUD sin embargo con ORM las base de datos se pueden utilizar como objetos para poder\n",
    "#MAPPEAR"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [
    {
     "ename": "ModuleNotFoundError",
     "evalue": "No module named 'sqlalchemy'",
     "output_type": "error",
     "traceback": [
      "\u001b[1;31m---------------------------------------------------------------------------\u001b[0m",
      "\u001b[1;31mModuleNotFoundError\u001b[0m                       Traceback (most recent call last)",
      "Cell \u001b[1;32mIn[1], line 1\u001b[0m\n\u001b[1;32m----> 1\u001b[0m \u001b[38;5;28;01mfrom\u001b[39;00m \u001b[38;5;21;01msqlalchemy\u001b[39;00m \u001b[38;5;28;01mimport\u001b[39;00m create_engine, MetaData, Table, Column, Integer, String\n",
      "\u001b[1;31mModuleNotFoundError\u001b[0m: No module named 'sqlalchemy'"
     ]
    }
   ],
   "source": [
    "from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.11.5"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
