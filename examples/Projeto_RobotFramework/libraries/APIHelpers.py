"""
Biblioteca Python customizada com helpers para testes de API
"""
import random
import json
import re
from datetime import datetime


class APIHelpers:
    """Classe com métodos auxiliares para testes de API"""
    
    def generate_random_number(self, min_value=1, max_value=100):
        """Gera um número aleatório entre min e max"""
        return random.randint(int(min_value), int(max_value))
    
    def generate_random_email(self):
        """Gera um email aleatório"""
        random_string = ''.join(random.choices('abcdefghijklmnopqrstuvwxyz', k=10))
        return f"{random_string}@test.com"
    
    def get_current_timestamp(self):
        """Retorna o timestamp atual"""
        return datetime.now().isoformat()
    
    def validate_json_schema(self, json_data, schema):
        """Valida JSON contra um schema"""
        try:
            from jsonschema import validate
            validate(instance=json_data, schema=schema)
            return True
        except Exception as e:
            raise AssertionError(f"Schema validation failed: {str(e)}")
    
    def extract_value_from_json(self, json_data, json_path):
        """Extrai valor de JSON usando path notation"""
        keys = json_path.split('.')
        value = json_data
        for key in keys:
            if '[' in key and ']' in key:
                # Handle array notation like items[0]
                array_key = key.split('[')[0]
                index = int(re.search(r'\[(\d+)\]', key).group(1))
                value = value[array_key][index]
            else:
                value = value[key]
        return value
    
    def compare_json_objects(self, actual, expected, ignore_keys=None):
        """Compara dois objetos JSON ignorando chaves específicas"""
        if ignore_keys is None:
            ignore_keys = []
        
        actual_copy = json.loads(json.dumps(actual))
        expected_copy = json.loads(json.dumps(expected))
        
        for key in ignore_keys:
            actual_copy.pop(key, None)
            expected_copy.pop(key, None)
        
        return actual_copy == expected_copy
    
    def create_query_string(self, params_dict):
        """Cria query string a partir de dicionário"""
        params = []
        for key, value in params_dict.items():
            params.append(f"{key}={value}")
        return "&".join(params)
    
    def parse_xml_to_dict(self, xml_string):
        """Converte XML string para dicionário"""
        import xml.etree.ElementTree as ET
        root = ET.fromstring(xml_string)
        return self._xml_to_dict(root)
    
    def _xml_to_dict(self, element):
        """Helper recursivo para converter XML em dict"""
        result = {}
        for child in element:
            if len(child) == 0:
                result[child.tag] = child.text
            else:
                result[child.tag] = self._xml_to_dict(child)
        return result
