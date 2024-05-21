import streamlit as st
import pandas as pd

# Title of the Streamlit app
st.title("Product Description Finder")

# File uploader to upload Excel file
uploaded_file = st.file_uploader("Upload an Excel file", type=["xlsx"])

if uploaded_file:
    # Read the uploaded Excel file
    df = pd.read_excel(uploaded_file)

    # Display the dataframe
    st.write("Uploaded Data:")
    st.dataframe(df)

    # Input box to enter product name
    product_name = st.text_input("Enter product name")

    if product_name:
        # Filter the dataframe to find the product description
        result = df[df['Product'].str.contains(product_name, case=False, na=False)]

        if not result.empty:
            st.write("Product Description:")
            st.write(result[['Product', 'Product Description']])
        else:
            st.write("No product found with that name.")