import os
import requests
from ruamel.yaml import YAML
from validators import url as validate_url

# Diretório de imagens
image_directory = 'assets/imagens/'

# Verifique se o diretório de imagens existe e crie-o, se necessário
if not os.path.exists(image_directory):
    os.makedirs(image_directory)

# Solicita a URL da imagem ao usuário
image_url = input("Insira a URL da imagem: ")

# Valida a URL
if not validate_url(image_url):
    print("URL inválida. Certifique-se de que a URL esteja no formato correto.")
else:
    # Solicita a ID iniciada por "tur" ou "ceb" ao usuário
    while True:
        image_id = input("Insira a ID (iniciada por 'tur' ou 'ceb'): ")
        if image_id.startswith("tur") or image_id.startswith("ceb"):
            break
        else:
            print("A ID deve começar com 'tur' ou 'ceb'. Tente novamente.")

    # Obtém o sequencial final para a ID
    existing_files = os.listdir(image_directory)
    max_sequence = 0

    for filename in existing_files:
        if filename.startswith(image_id + "_"):
            sequence = int(filename.split("_")[-1].split(".")[0])
            max_sequence = max(max_sequence, sequence)

    # Incrementa o sequencial final
    new_sequence = max_sequence + 1

    # Nome do arquivo de imagem
    image_filename = f"{image_id}_{new_sequence}.png"

    # Caminho completo para a imagem
    image_path = os.path.join(image_directory, image_filename)

    # Baixe a imagem da URL
    response = requests.get(image_url)
    if response.status_code == 200:
        with open(image_path, 'wb') as image_file:
            image_file.write(response.content)
        print(f'Imagem baixada com sucesso: {image_path}')

        # Atualize o arquivo pubspec.yaml
        yaml = YAML()
        pubspec_path = 'pubspec.yaml'
        with open(pubspec_path, 'r') as pubspec_file:
            pubspec_data = yaml.load(pubspec_file)
            if 'flutter' in pubspec_data and 'assets' in pubspec_data['flutter']:
                pubspec_data['flutter']['assets'].append(image_path)
            else:
                pubspec_data['flutter'] = {'assets': [image_path]}

        with open(pubspec_path, 'w') as pubspec_file:
            yaml.dump(pubspec_data, pubspec_file)
            print(f'pubspec.yaml atualizado com a imagem: {image_path}')
    else:
        print(f'Erro ao baixar a imagem. Status de resposta: {response.status_code}')
