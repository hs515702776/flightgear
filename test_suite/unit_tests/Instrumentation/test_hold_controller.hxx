/*
 * Copyright (C) 2019 James Turner
 *
 * This file is part of the program FlightGear.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


#ifndef _FG_HOLD_CTL_UNIT_TESTS_HXX
#define _FG_HOLD_CTL_UNIT_TESTS_HXX


#include <cppunit/extensions/HelperMacros.h>
#include <cppunit/TestFixture.h>

#include <memory>

#include <simgear/props/props.hxx>

class SGGeod;
class GPS;

// The flight plan unit tests.
class HoldControllerTests : public CppUnit::TestFixture
{
    // Set up the test suite.
    CPPUNIT_TEST_SUITE(HoldControllerTests);
    CPPUNIT_TEST(testHoldEntryDirect);
    CPPUNIT_TEST(testHoldEntryTeardrop);
    CPPUNIT_TEST(testHoldEntryParallel);
    CPPUNIT_TEST(testLeftHoldEntryDirect);
    CPPUNIT_TEST(testLeftHoldEntryTeardrop);
    CPPUNIT_TEST(testLeftHoldEntryParallel);
    CPPUNIT_TEST(testHoldNotEntered);
    CPPUNIT_TEST(testHoldEntryOffCourse);
    
    CPPUNIT_TEST_SUITE_END();

    void setPositionAndStabilise(const SGGeod& g);

    GPS* setupStandardGPS(SGPropertyNode_ptr config = {},
                                          const std::string name = "gps", const int index = 0);
    void setupRouteManager();
    
public:
    // Set up function for each test.
    void setUp();

    // Clean up after each test.
    void tearDown();

    // The tests.
    void testHoldEntryDirect();
    void testHoldEntryTeardrop();
    void testHoldEntryParallel();
    void testLeftHoldEntryDirect();
    void testLeftHoldEntryTeardrop();
    void testLeftHoldEntryParallel();
    void testHoldNotEntered();
    void testHoldEntryOffCourse();
private:
    GPS* m_gps = nullptr;
    SGPropertyNode_ptr m_gpsNode;
};

#endif  // _FG_HOLD_CTL_UNIT_TESTS_HXX
