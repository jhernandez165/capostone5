package com.aline.core.crypto;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;

@Converter
public class AttributeEncryptor implements AttributeConverter<String, String> {

    @Override
    public String convertToDatabaseColumn(String attribute) {
        return attribute; // Bypassing encryption
    }

    @Override
    public String convertToEntityAttribute(String dbData) {
        return dbData; // Bypassing decryption
    }
}
