@IsTest
private class DummyReleaseClassTest {
    @IsTest
    static void testPing() {
        System.assertEquals('Release OK', DummyReleaseClass.ping());
    }
}