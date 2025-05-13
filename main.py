import pandas as pd
df = pd.read_csv("Perfil_de_morbilidad_20250423 (1).csv", sep=",", quotechar='"', engine='python', skip_blank_lines=True)

print("cabecera para entender los datos\n", df.head())

df = df.drop_duplicates() #elimina duplicados

df = df.dropna() #elimina datos que contienen al menos un valor nulo (NaN).

print("visualizo datos limpios despues de la funcion eliminar duplicados y valor nulo\n", df.head())

import matplotlib.pyplot as plt
import seaborn as sns

plt.figure(figsize=(8, 5))
sns.histplot(df["EDAD DE ATENCION (AÑOS)"], bins=30, kde=True)
plt.title("Distribución de edades de atención")
plt.xlabel("Edad")
plt.ylabel("Frecuencia")
plt.grid(True)
plt.show()

top_diagnosticos = df["NOMBRE DEL DIAGNOSTICO"].value_counts().head(10)

plt.figure(figsize=(10, 6))
sns.barplot(x=top_diagnosticos.values, y=top_diagnosticos.index)
plt.title("10 Diagnósticos más frecuentes")
plt.xlabel("Número de casos")
plt.ylabel("Diagnóstico")
plt.show()


import matplotlib.pyplot as plt
import seaborn as sns
sns.countplot(data=df, y="UNIDAD FUNCIONAL", order=df["UNIDAD FUNCIONAL"].value_counts().head(10).index)
plt.title("Consultas por unidad funcional")
plt.xlabel("Número de casos")
plt.ylabel("Unidad funcional")
plt.tight_layout()
plt.show()