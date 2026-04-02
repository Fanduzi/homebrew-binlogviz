cask "binlogviz" do
  version "0.8.2"

  on_macos do
    on_intel do
      sha256 "2fe4e5ba395ab43ba1779dfb708c0149cb0eddbcd663e3d439eb04d67c9ca4e7"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.2/binlogviz_0.8.2_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "f6ecf835af2708289ff70f3791b92ad8779d4d447facbd0a4dc399dd71767101"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.2/binlogviz_0.8.2_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "80124ee8d2c4cb53ddb425fa57b1dc22b26ebaf2fb33419a264de15afa26b900"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.2/binlogviz_0.8.2_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "c2bdaee5442b1695e2976efbc17a48bbc9ed01fba6d2b8d5e6c021a9c5f4c2b5"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.8.2/binlogviz_0.8.2_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
