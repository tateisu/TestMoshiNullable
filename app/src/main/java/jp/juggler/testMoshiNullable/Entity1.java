package jp.juggler.testMoshiNullable;

import androidx.annotation.Keep;
import androidx.annotation.Nullable;

import java.util.Map;

@Keep
public class Entity1 {
    @Nullable
    public Map<String, Object> errors;
}
