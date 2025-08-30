#!/bin/bash

# JayGoga-Orchestra Build and Deploy Script
echo "🎼 Building JayGoga-Orchestra for PyPI deployment..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
rm -rf build/
rm -rf dist/
rm -rf *.egg-info/

# Install build dependencies
echo "📦 Installing build dependencies..."
pip install --upgrade build twine

# Build the package
echo "🔨 Building package..."
python -m build

# Check the built package
echo "🔍 Checking package..."
python -m twine check dist/*

# Test installation locally
echo "🧪 Testing local installation..."
pip install dist/*.whl --force-reinstall

# Test import
echo "✅ Testing import..."
python -c "
import jaygoga_orchestra
print(f'✓ JayGoga-Orchestra v{jaygoga_orchestra.__version__} imported successfully')

from jaygoga_orchestra.v1 import Agent, Task, Squad, Process
print('✓ v1 imports successful')

from jaygoga_orchestra.v2 import Agent as AgentV2, Team, Workflow
print('✓ v2 imports successful')

print('🎉 All tests passed! Package is ready for deployment.')
"

echo "📋 Deployment Summary:"
echo "====================="
echo "Package Name: jaygoga-orchestra"
echo "GitHub: https://github.com/AIMLDev726/jaygoga_orchestra"
echo "Built files in: ./dist/"
echo ""
echo "To deploy to PyPI:"
echo "python -m twine upload dist/*"
echo ""
echo "To install from PyPI (after upload):"
echo "pip install jaygoga-orchestra"
echo ""
echo "🚀 Ready for deployment!"
