from flask import Flask, request, jsonify
from paddleocr import PaddleOCR
import tempfile

app = Flask(__name__)
ocr = PaddleOCR(
    use_doc_orientation_classify=False,
    use_doc_unwarping=False,
    use_textline_orientation=False)

@app.route('/ocr', methods=['POST'])
def perform_ocr():
    if 'file' not in request.files:
        return jsonify({'error': 'No image provided'}), 400

    upload = request.files['file']
    with tempfile.NamedTemporaryFile(suffix=upload.filename) as t:
        upload.save(t.name)
        result = ocr.predict(t.name)
        return jsonify(result[0].json)

@app.route('/health', methods=['GET'])
def health_check():
    return jsonify({'status': 'PaddleOCR server is running.'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
