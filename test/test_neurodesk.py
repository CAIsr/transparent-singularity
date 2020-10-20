
from neurodesk.neurodesk import vnm_xml

import xml.etree.ElementTree as et
import filecmp

from pathlib import Path
import pytest

def test_vnm_xml(tmp_path):
    # Read in test applications.menu (for lxde)
    xml = Path('test/test_lxde-applications.menu').resolve(strict=True)
    et.parse(xml)

    newxml = tmp_path/'new.xml'
    vnm_xml(xml, newxml)
    et.parse(newxml)
    # Assert change in xml file
    assert not filecmp.cmp(xml, newxml)
