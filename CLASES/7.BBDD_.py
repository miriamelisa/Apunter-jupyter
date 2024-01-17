from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String , Sequence
from sqlalchemy.ext.declarative import declarative_base
# Crea una instancia de la clase 'declarative_base' para definir clases de modelo
Base = declarative_base()

# Define una clase de modelo llamada 'Usuario'
class Usuario(Base):
    __tablename__ = 'Personas'

    id = Column(Integer, Sequence('Person_ID'), primary_key=True)
    nombre = Column(String(50))
    edad = Column(String(50))

# Crea la tabla en la base de datos en memoria
BDCONTENEDOR = create_engine('sqlite:///:memory:', echo=True)
Base.metadata.create_all(BDCONTENEDOR)