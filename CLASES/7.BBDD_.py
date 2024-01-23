from sqlalchemy import create_engine, MetaData, Table, Column, Integer, String , Sequence
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
# Crea una instancia de la clase 'declarative_base' para definir clases de modelo
Base = declarative_base()

# Define una clase de modelo llamada 'Usuario'
class Personas(Base):
    __tablename__ = 'Personas'

    id = Column(Integer, Sequence('Person_ID'), primary_key=True)
    nombre = Column(String(50))
    edad = Column(String(50))

# Crea la tabla en la base de datos en memoria
BDCONTENEDOR = create_engine('sqlite:///:memory:', echo=True)
Base.metadata.create_all(BDCONTENEDOR)

# Crea una sesión
Session = sessionmaker(bind=BDCONTENEDOR)
session = Session()

# Ejemplo de uso de la sesión
new_person = Personas(nombre='Pepe', edad='30')
session.add(new_person)
session.add(Personas(nombre='Miri', edad='26'))
session.add(Personas(nombre='Luis', edad='26'))
session.commit()
PERSONAS = session.query(Personas).all()
for P in PERSONAS:
    print(f"ID: {P.id}, Nombre: {P.nombre}, Edad: {P.edad}")

actualizar_persona = session.query(Personas).filter_by(nombre='Pepe').first()

if actualizar_persona:
    actualizar_persona.edad=46
    session.commit()

for P in PERSONAS:
    print(f"ID: {P.id}, Nombre: {P.nombre}, Edad: {P.edad}")

eliminar_persona = session.query(Personas).filter_by(nombre='Pepe').first()

# Verifica si se encontró la instancia de "Pepe"
if eliminar_persona:
    # Elimina a "pepe" de la base de datos
    session.delete(eliminar_persona)
    session.commit()

PERSONAS = session.query(Personas).all()
for P in PERSONAS:
    print(f"ID: {P.id}, Nombre: {P.nombre}, Edad: {P.edad}")

